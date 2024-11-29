<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $table = 'category';

    protected $fillable = [
        'name',
    ];

    /**
     * Get the users that belong to this category.
     */
    public function users()
    {
        return $this->hasMany(User::class);
    }
    public function absences()
    {
        return $this->hasMany(Absence::class);
    }

    public function attendances()
    {
        return $this->hasMany(Attendance::class);
    }
}
