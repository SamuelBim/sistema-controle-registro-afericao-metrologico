<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
use App\Models\Veiculo;

class Veiculos extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = Veiculo::count();
        $string = 'Veiculos';//trans_choice('voyager::dimmer.user', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-truck',
            'title'  => "{$count} {$string}",
            'text'   => "Você tem {$count} veículos em seu banco de dados. Clique no botão abaixo para ver todos os veiculos",
            'button' => [
                'text' => 'Ver',
                'link' => route('voyager.veiculos.index'),
            ],
            'image' => asset('storage/widgets/caminhao.jpg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', new Veiculo());
    }
}
