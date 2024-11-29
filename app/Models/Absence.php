<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Absence extends Model
{
    use HasFactory;
    protected $table = 'absence';
    protected $fillable = [
        'name',
        'category_id',
        'latitude',
        'longitude',
        'radius_m',
        'time_in',
        'time_out',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }


}
