<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\TagsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/posts', [PostController::class, 'index']); // Fetch posts with filtering and pagination

Route::post('/posts', [PostController::class, 'store']); // Create a new post
Route::get('/post-details/{id}', [PostController::class, 'post_details']); //get individual post details
Route::put('/posts-update/{id}', [PostController::class, 'update']); // Edit an existing post
Route::delete('/posts/{id}', [PostController::class, 'destroy']); // Delete a post

Route::get('/categories', [CategoryController::class, 'index']); //get all categories

Route::get('/all-deleted-posts', [PostController::class, 'all_deleted_posts']); // Fetch all deleted posts
Route::get('/restore-post/{id}', [PostController::class, 'restore_posts']); // restore deleted post

