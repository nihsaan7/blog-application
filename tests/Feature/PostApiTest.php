<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Post;
use App\Models\Category;
use App\Models\Tag;
use App\Models\User;
use App\Models\Comment;

class PostApiTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_fetch_posts_with_filters(): void
    {
        $category = Category::factory()->create(['name' => 'Tech']);
        $tags = Tag::factory(3)->create();
        $post = Post::factory()->create(['category_id' => $category->id]);
        $post->tags()->attach($tags);
        Comment::factory(3)->create(['post_id' => $post->id]);

        // Make API request
        $response = $this->getJson('/api/posts?category=Tech');

        // Assert response structure
        $response->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    '*' => [
                        'id',
                        'title',
                        'content',
                        'category',
                        'tags',
                        'comments' => [
                            '*' => ['author', 'content', 'created_at'],
                        ],
                    ],
                ],
                'meta' => ['current_page', 'last_page', 'total'],
            ]);

    }
}
