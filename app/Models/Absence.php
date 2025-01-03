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
        'time_in_sesi2',
        'time_out_sesi2',
        'time_in_sesi3',
        'time_out_sesi3',
        'time_in_sesi4',
        'time_out_sesi4',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function attendances()
    {
        return $this->hasMany(Attendance::class);
    }
}
