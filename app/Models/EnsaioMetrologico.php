<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class EnsaioMetrologico extends Model
{
    protected $table= 'ensaios_metrologicos';

    public function veiculo()
    {
        return $this->belongsTo(\App\Models\Veiculo::class);
    }

}
