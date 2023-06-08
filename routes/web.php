<?php

use Illuminate\Support\Facades\Route;
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/ensaios-metrologicos/{id}', function ($id) {

    $ensaioMetrologico = \App\Models\EnsaioMetrologico::find($id);

    \PhpOffice\PhpWord\Settings::setDefaultPaper('A4');
    // Cria uma instância do PhpWord
    $documentoWord = new PhpWord();

    // Cria uma seção no documento
    $section = $documentoWord->addSection();

    // Define as configurações da página
    $section->getStyle()
    ->setMarginTop(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2))
    ->setMarginRight(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2))
    ->setMarginBottom(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2))
    ->setMarginLeft(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2));

    // Adiciona a foto do CLVR ao documento
    $imagePath = public_path('storage/' . $ensaioMetrologico->foto_documento);
    // Obtém as dimensões da imagem
    list($width, $height) = getimagesize($imagePath);

    // Calcula a largura desejada em pixels
    $larguraDocumento = $section->getStyle()->getPageSizeW() - $section->getStyle()->getMarginLeft() - $section->getStyle()->getMarginRight();
    $imageWidth = (twipToPoint($larguraDocumento) * 1);
    // dd($section->getStyle()->getPageSizeW(),$section->getStyle(),$imageWidth);
    // Calcula a proporção para redimensionar a imagem
    $aspectRatio = $width / $height;
    $imageHeight = $imageWidth / $aspectRatio;

    // Adiciona a imagem ao documento com as dimensões calculadas
    $section->addImage($imagePath, [
        'width' => $imageWidth,
        'height' => $imageHeight,
        'align' => 'center'
    ]);

    // Adiciona a foto do Cronotacografo ao documento
    $imagePath = public_path('storage/' . $ensaioMetrologico->foto_cronotacografo);
    // Obtém as dimensões da imagem
    list($width, $height) = getimagesize($imagePath);

    $alturaDocumento = $section->getStyle()->getPageSizeH() - $section->getStyle()->getMarginTop() - $section->getStyle()->getMarginBottom() - $imageHeight;
    $imageHeight = (twipToPoint($alturaDocumento) * 0.9) - $imageHeight;
    $aspectRatio = $width / $height;
    // $imageWidth = $imageHeight / $aspectRatio;

    $section->addImage($imagePath, [
        'width' => $imageWidth,
        'height' => $imageHeight,
        'align' => 'center'
    ]);

    // Define o nome do arquivo
    $filename = 'CRLV_digital_' . $ensaioMetrologico->veiculo->placa . '.docx';

    // Salva o documento em um arquivo
    $filePath = storage_path('app/public/documentos/' . $filename);
    $documentoWord->save($filePath);

    // Retorna o arquivo para download
    return response()->download($filePath)->deleteFileAfterSend(true);
})->name('ensaio.metrologico.gerarCRLV');

function twipToPoint($twip) {
    return $twip / 20;
}

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
