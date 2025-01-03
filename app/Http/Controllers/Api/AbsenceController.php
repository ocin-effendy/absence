<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Absence;

class AbsenceController extends Controller
{
    
    public function getByCategory(Request $request)
    {
        try {
            // Validate query parameter
            $request->validate([
                'category_id' => 'required',
            ]);

            $category_id = $request->query('category_id');

            // Retrieve absences by category_id
            $absences = Absence::where('category_id', $category_id)->get();

            if ($absences->isEmpty()) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'No absences found for the specified category ID.',
                ], 404);
            }

            return response()->json([
                'status' => 'success',
                'data' => $absences,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'An error occurred while retrieving absences.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
