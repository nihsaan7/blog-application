<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use App\Models\Comment;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        // Seed Categories
        $categories = Category::factory(5)->create();

        // Seed Tags
        $tags = Tag::factory(10)->create();

        // Seed Posts with Comments and Tags
        $categories->each(function ($category) use ($tags) {
            $posts = Post::factory(3)->create(['category_id' => $category->id]);

            $posts->each(function ($post) use ($tags) {
                // Attach random tags
                $post->tags()->attach($tags->random(rand(2, 5)));

                // Create comments
                Comment::factory(rand(2, 5))->create(['post_id' => $post->id]);
            });
        });

        
    }
}
