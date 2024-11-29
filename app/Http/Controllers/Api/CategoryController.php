<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function index(){

        $categories = Category::all(['id', 'name']); // Only retrieve the 'id' and 'name' fields

        // Return the categories as a JSON response
        return response()->json([
            'data' => $categories
        ]);

    }
}
