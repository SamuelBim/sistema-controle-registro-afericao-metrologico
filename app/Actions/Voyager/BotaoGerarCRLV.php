<?php

namespace App\Actions\Voyager;

use TCG\Voyager\Actions\AbstractAction;

class BotaoGerarCRLV extends AbstractAction
{
    public function getTitle()
    {
        return 'Gerar CRLV';
    }

    public function getIcon()
    {
        return 'voyager-archive';
    }

    public function getAttributes()
    {
        return [
            'class' => 'btn btn-sm btn-primary pull-right',
        ];
    }

    public function getDefaultRoute()
    {
        return route('ensaio.metrologico.gerarCRLV',['id'=>$this->data->id]);
    }

		/**
     * Se Você só quer mostrar sua ação para telas especificas:
     */
    public function shouldActionDisplayOnDataType()
    {
        return $this->dataType->slug == 'ensaios-metrologicos';
    }


}
