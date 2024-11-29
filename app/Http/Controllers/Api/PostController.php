<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Http\Requests\PostRequest;
use App\Models\User;
use App\Models\Category;
use App\Models\Tag;
use Illuminate\Support\Facades\Mail;
use App\Mail\PostCreatedNotification;
use Exception;

class PostController extends Controller
{
    public function index(Request $request)
    {
        // Fetch posts with comments, category, and tags
        $query = Post::with(['comments', 'category', 'tags']);

        // Apply filters if provided
        if ($request->has('category')) {
            $query->whereHas('category', function ($q) use ($request) {
                $q->where('name', $request->category);
            });
        }

        if ($request->has('tag')) {
            $query->whereHas('tags', function ($q) use ($request) {
                $q->where('name', $request->tag);
            });
        }

        if ($request->has(['start_date', 'end_date'])) {
            $query->whereBetween('created_at', [$request->start_date, $request->end_date]);
        }

        // Paginate the results
        $posts = $query->orderBy('id','desc')->paginate(5);

        // Return a custom JSON response
        return response()->json([
            'data' => $posts->map(function ($post) {
                return [
                    'id' => $post->id,
                    'title' => $post->title,
                    'image' => $post->image,
                    'content' => $post->content,
                    'category' => $post->category->name,
                    'tags' => $post->tags->pluck('name'),
                    'comments' => $post->comments->map(function ($comment) {
                        return [
                            'author' => $comment->author,
                            'content' => $comment->content,
                            'created_at' => $comment->created_at->toDateTimeString(),
                        ];
                    }),
                ];
            }),
            'meta' => [
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'total' => $posts->total(),
            ],
        ]);
    }

    public function post_details($id)
    {
       
        // Fetch posts with comments, category, and tags
        $posts = Post::with(['comments', 'category', 'tags'])->where('id', $id)->first();

        // Check if the post exists before returning the response
        if (!$posts) {
            return response()->json(['message' => 'Post not found'], 404);
        }

        // Return a custom JSON response
        return response()->json([
            'data' => [
                'id' => $posts->id,
                'title' => $posts->title,
                'image' => $posts->image,
                'content' => $posts->content,
                'category' => $posts->category->name,
                'tags' => $posts->tags->pluck('name'),
                'comments' => $posts->comments->map(function ($comment) {
                    return [
                        'author' => $comment->author,
                        'content' => $comment->content,
                        'created_at' => $comment->created_at->toDateTimeString(),
                    ];
                }),
            ],
        ]);

    }

     public function store(PostRequest $request)
    {
        // dd($request);    
        
        try {
            // Validate and retrieve the request data
            $validatedData = $request->validated();
        
            // Handle image upload if provided
            if ($request->hasFile('image') && $request->file('image')->isValid()) {
                $imagePath = $request->file('image')->store('posts', 'public');
                $validatedData['image'] = $imagePath;
            }
        
            // Create the post
            $post = Post::create([
                'title' => $validatedData['title'],
                'content' => $validatedData['content'],
                'image' => $validatedData['image'] ?? null,
                'category_id' => $validatedData['category'],
                'author_id' => auth()->id(),
            ]);
        
            // Process and attach tags
            if (!empty($validatedData['tags'])) {
                $tagIds = [];
                foreach ($validatedData['tags'] as $tagName) {
                    // Find or create the tag and get its ID
                    $tag = Tag::firstOrCreate(['name' => $tagName]);
                    $tagIds[] = $tag->id;
                }
                // Attach the tag IDs to the post
                $post->tags()->sync($tagIds);
            }
        
            // Send email notification to the author
            $author = User::findOrFail(auth()->id());            
        
            Mail::to($author->email)->send(new PostCreatedNotification($post));
        
            // Return a success response
            return response()->json(['message' => 'Post created successfully!', 'post' => $post], 201);
        
        } catch (\Exception $e) {
            // Return error response
            return response()->json(['message' => 'Error creating post', 'error' => $e->getMessage()], 500);
        }

    }


    public function update(PostRequest $request, Post $post)
    {
        // dd($request);

        try {
            // Validate and retrieve the request data
            $validatedData = $request->validated();
        
            // Handle image upload if provided
            if ($request->hasFile('image') && $request->file('image')->isValid()) {
                $imagePath = $request->file('image')->store('posts', 'public');
                $validatedData['image'] = $imagePath;
            }
        
            // Create or update the post
            $post = Post::updateOrCreate([
                'title' => $validatedData['title'],
                'content' => $validatedData['content'],
                'image' => $validatedData['image'] ?? null,
                'category_id' => $validatedData['category'],
                'author_id' => auth()->id(),
            ]);
        
            // Process and attach tags
            if (!empty($validatedData['tags'])) {
                $tagIds = [];
                foreach ($validatedData['tags'] as $tagName) {
                    // Find or create the tag and get its ID
                    $tag = Tag::firstOrCreate(['name' => $tagName]);
                    $tagIds[] = $tag->id;
                }
                // Attach the tag IDs to the post
                $post->tags()->sync($tagIds);
            }
        
            // Send email notification to the author
            $author = User::findOrFail(auth()->id());            
        
            Mail::to($author->email)->send(new PostCreatedNotification($post));
        
            // Return a success response
            return response()->json(['message' => 'Post updated successfully!', 'post' => $post], 201);
        
        } catch (\Exception $e) {
            // Return error response
            return response()->json(['message' => 'Error updating post', 'error' => $e->getMessage()], 500);
        }

    }

    public function destroy($id)
    {
        // Find the post by ID
        $post = Post::find($id);

        // Check if the post exists
        if (!$post) {
            return response()->json(['message' => 'Post not found'], 404);
        }

        // Perform a soft delete by updating 'deleted_at' with the current timestamp
        $post->delete();

        // Return a success response
        return response()->json(['message' => 'Post deleted successfully'], 200);
    }


    public function all_deleted_posts(Request $request)
    {
        // Fetch only deleted posts with comments, category, and tags
        $query = Post::with(['comments', 'category', 'tags'])->onlyTrashed();
        
        // Paginate the results
        $posts = $query->orderBy('deleted_at','desc')->paginate(7);

        // Return a custom JSON response
        return response()->json([
            'data' => $posts->map(function ($post) {
                return [
                    'id' => $post->id,
                    'title' => $post->title,
                    'image' => $post->image,
                    'content' => $post->content,
                    'category' => $post->category->name,
                    'tags' => $post->tags->pluck('name'),
                    'comments' => $post->comments->map(function ($comment) {
                        return [
                            'author' => $comment->author,
                            'content' => $comment->content,
                            'created_at' => $comment->created_at->toDateTimeString(),
                        ];
                    }),
                ];
            }),
            'meta' => [
                'current_page' => $posts->currentPage(),
                'last_page' => $posts->lastPage(),
                'total' => $posts->total(),
            ],
        ]);
    }


    public function restore_posts($id)
    {
        // Find the post by ID with all rows in table despite deleted
        $post = Post::withTrashed()->find($id);

        // Check if the post exists
        if (!$post) {
            return response()->json(['message' => 'Post not found'], 404);
        }

        // Update the 'deleted_at' column
        $post->update(['deleted_at' => null]);

        // Return a success response
        return response()->json(['message' => 'Post restored successfully'], 200);
    }
    

}
