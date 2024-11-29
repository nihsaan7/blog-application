<!DOCTYPE html>
<html>
<head>
    <title>The Post Updated</title>
</head>
<body>
    <h1>The post has been Updated</h1>
    <p><strong>Title:</strong> {{ $post->title }}</p>
    <p><strong>Content:</strong></p>
    <p>{{ $post->content }}</p>
    <p><strong>Category:</strong> {{ $post->category->name }}</p>
    @if($post->image)
        <p><strong>Image:</strong></p>
        <img src="{{ asset('storage/' . $post->image) }}" alt="Post Image" style="max-width: 60%; height: auto;">
    @endif
    <p>Thank you for your contribution!</p>
</body>
</html>
