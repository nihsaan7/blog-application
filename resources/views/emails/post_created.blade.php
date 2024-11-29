<!DOCTYPE html>
<html>
<head>
    <title>New Post Created</title>
</head>
<body>
    <h1>A new post has been created</h1>
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
