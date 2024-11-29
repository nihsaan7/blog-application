@extends('front-layout')

@section('content')

    <div class="container">
        <h1 class="my-5">{{$post->title}}</h1>

        <!-- Post Content -->
        
        @if($post->image)
            <img src="{{asset('storage/'.$post->image)}}" alt="Post Image" class="post-image">
        @else
            <img src="{{asset('images/no-image.jpg')}}" alt="Post Image" class="post-image">
        @endif

        @if($user)<p class="mt-4">Author: {{$user->name}}</p>@endif
        <p class="mt-4">{{$post->content}}</p>

        <!-- Comment Section -->
        <div class="comments mt-5 mb-5">
            <h3>Comments</h3>

            @if(session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            @if(count($post->comments))
                @foreach($post->comments as $key => $comment)
                    <div class="comment">
                        <p><strong>{{$comment->author ? $comment->author : 'Anonymous'}}:</strong> {{$comment->content}}.</p>
                    </div>
                @endforeach
            @endif

            <!-- Comment Form -->
            <div class="comment-form">
                <h4>Add a Comment</h4>
                <form action="{{ route('blog-post-comment') }}" method="POST" enctype="multipart/form-data">
                @csrf
                    <div class="mb-3">
                        <label for="comment" class="form-label">Your Comment</label>
                        <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                        <input type="hidden" name="post_id" value="{{$post->id}}" /> 
                    </div>
                    <button type="submit" class="btn btn-primary">Post Comment</button>
                </form>
            </div>
        </div>
    </div>

   
@endsection