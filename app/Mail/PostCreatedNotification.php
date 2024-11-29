<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use App\Models\Post;


class PostCreatedNotification extends Mailable
{
    use Queueable, SerializesModels;

    public $post;

    /**
     * Create a new message instance.
     */
    public function __construct(Post $post)
    {
        $this->post = $post;
    }

 
    public function build()
    {
        return $this->subject('Post saved successfully: ' . $this->post->title)
            ->view('emails.post_created')
            ->with([
                'post' => $this->post, // Pass the post data to the view
            ]);
    }
}
