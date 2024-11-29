<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        
        $categories = Category::where('name', 'like', '%' . request('name') . '%')
            ->orderBy('id', 'desc')
            ->paginate(10);
        return view('pages.category.index', compact('categories'));

    }

    public function create()
    {
        return view('pages.category.create');
    }

    public function destroy($id)
    {
        $categories = Category::find($id);

        if (!$categories) {
            return redirect()->route('categories.index')->with('error', 'categories not found');
        }

        $categories->delete();

        return redirect()->route('categories.index')->with('success', 'Category deleted successfully');
    }

    public function edit($id)
    {
        $categories = Category::find($id);
        return view('pages.category.edit', compact('categories'));

    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ]);

        Category::create([
            'name' => $request->name,
        ]);

        return redirect()->route('categories.index')->with('success', 'Category created successfully');
    }

    public function update(Request $request, Category $category)
    {
        $request->validate([
            'name' => 'required',
        ]);

        $category->update([
            'name' => $request->name,
        ]);

        return redirect()->route('categories.index')->with('success', 'Category updated successfully');
    }
}
