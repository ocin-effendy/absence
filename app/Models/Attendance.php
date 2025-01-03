<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;
    protected $table = 'attendance';

    protected $fillable = [
        'user_id',
        'absence_id',
        'category_id',
        'date',
        'time',
        'sesi',
        'status',
        'latlon_in',
        'latlon_out',
        'image_url',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function absence()
    {
        return $this->belongsTo(Absence::class);
    }
    
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }
}
