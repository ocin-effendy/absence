<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'date',
        'time_in',
        'time_out',
        'latlon_in',
        'latlon_out',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }
}
