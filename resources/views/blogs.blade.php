@extends('front-layout')

@section('content')

    <div class="container">
        <h1 class="my-5">All Posts</h1>

        <div class="row">
            @if(count($posts) != 0)
                @foreach($posts as $post)
                    <div class="col-md-4">
                        <div class="card post-card">
                            @if($post->image)
                                <img src="{{ asset('storage/'.$post->image) }}" alt="Post Image">
                            @else
                                <img src="{{ asset('images/no-image.jpg') }}" alt="Post Image">
                            @endif
                            <div class="card-body">
                                <h5 class="card-title">{{ Str::limit($post->title, 35) }}</h5>
                                <p class="card-text">{{ Str::limit($post->content, 80) }}</p>
                                <a href="{{ route('blog-post', ['id' => $post->id]) }}" class="btn btn-primary">Read More</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <p class="text-center">No posts available.</p>
            @endif
        </div>

        <!-- Custom Pagination -->
        <div class="pagination justify-content-center mt-3 mb-5">
            {{ $posts->links('vendor.pagination.bootstrap-4') }}
        </div>
    </div>

   
@endsection