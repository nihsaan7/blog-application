<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Comment;
use App\Models\User;

class BlogController extends Controller
{
    public function index() {

        $posts = Post::orderby('created_at','desc')->paginate(9);

        return view('blogs',[
            'posts' => $posts
        ]);

    }

    public function blogPost($id) {

        $post = Post::with('comments')->where('id',$id)->first();
        $user = User::where('id',$post->author_id)->first();

        return view('blog-details',[
            'post' => $post,
            'user' => $user
        ]);
    }

    public function blogPostComment(Request $request){

        $add = new Comment;
        $add->content = $request->comment;
        $add->post_id = $request->post_id;
        $add->author = auth()->user() ? auth()->user()->name : null;
        $add->save();

        return back()->with('success', 'Comment added successfully!');

    } 

}
