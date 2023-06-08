<?php

namespace App\Actions\Voyager;

use TCG\Voyager\Actions\AbstractAction;

class BotaoGerarMuitosCRLV extends AbstractAction
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
        return route('ensaio.metrologico.gerarCRLV', ['id' => $this->data->id]);
    }

    /**
     * Se Você só quer mostrar sua ação para telas especificas:
     */
    public function shouldActionDisplayOnDataType()
    {
        return $this->dataType->slug == 'ensaios-metrologicos';
    }

    //para ações em massa:
    public function massAction($ids, $comingFrom)
    {
        // Do something with the IDs
        //dd($ids);
        $filePath = \App\Http\Controllers\DocumentosController::gerarDocumento($ids);
        // return redirect()->back();
        return response()->download($filePath)->deleteFileAfterSend(true);
    }
}
