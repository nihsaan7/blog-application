<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Post;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Comment>
 */
class CommentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */

    protected $model = \App\Models\Comment::class;

    public function definition(): array
    {
        return [
            'post_id' => Post::factory(),
            'author' => $this->faker->word,
            'content' => $this->faker->sentence,
        ];
    }
}
