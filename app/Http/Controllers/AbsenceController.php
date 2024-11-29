<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Absence;
use App\Models\User;
use App\Models\Permission;
use App\Models\Category;

class AbsenceController extends Controller
{

    public function index(Request $request)
    {
        $categories = Category::all();

        $query = Absence::with('category');

        if (request('category_id')) {
            $query->where('category_id', request('category_id'));
        }

        if (request('name')) {
            $query->where('name', 'like', '%' . request('name') . '%');
        }

        
        $absences = $query->orderBy('id', 'desc')->paginate(10);
        return view('pages.absence.index', compact('absences', 'categories'));

    }

    public function create()
    {
        $categories = Category::all();
        return view('pages.absence.create', compact('categories'));
    }

    //view
    public function show($id)
    {
        $absence = Absence::find($id);

        if (!$absence) {
            return redirect()->route('absences.index')->with('error', 'Absence not found.');
        }

        return view('pages.absence.show', compact('absence'));
    }

    public function destroy($id)
    {
        $absence = Absence::find($id);

        if (!$absence) {
            return redirect()->route('absences.index')->with('error', 'Absence not found');
        }

        $absence->delete();

        return redirect()->route('absences.index')->with('success', 'Absence deleted successfully');
    }

    public function edit(Absence $absence)
    {
        $categories = Category::all();
        return view('pages.absence.edit', compact('absence', 'categories'));

    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'category_id' => 'required|exists:category,id',
            'latitude' => 'required',
            'longitude' => 'required',
            'radius_m' => 'required',
            'time_in' => 'required',
            'time_out' => 'required',
        ]);

        Absence::create([
            'name' => $request->name,
            'category_id' => $request->category_id,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'radius_m' => $request->radius_m,
            'time_in' => $request->time_in,
            'time_out' => $request->time_out,
        ]);

        return redirect()->route('absences.index')->with('success', 'Absence created successfully');
    }

    public function update(Request $request, Absence $absence)
    {
        $request->validate([
            'name' => 'required',
            'category_id' => 'required|exists:category,id',
            'latitude' => 'required',
            'longitude' => 'required',
            'radius_m' => 'required',
            'time_in' => 'required',
            'time_out' => 'required',
        ]);

        $absence->update([
            'name' => $request->name,
            'category_id' => $request->category_id,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'radius_m' => $request->radius_m,
            'time_in' => $request->time_in,
            'time_out' => $request->time_out,
        ]);

        return redirect()->route('absences.show', $absence->id)->with('success', 'Absence updated successfully');
    }


    
}
