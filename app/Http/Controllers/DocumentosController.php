<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\IOFactory;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class DocumentosController extends Controller
{
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function gerarDocumentoDeEnsaioMetrologico($id)
    {
        \PhpOffice\PhpWord\Settings::setDefaultPaper('A4');
        // Cria uma instância do PhpWord
        $documentoWord = new PhpWord();

        self::adicionarPagina($id, $documentoWord);

        // Define o nome do arquivo
        $nomeDoArquivo = 'CRLV_digital_' . Carbon::now()->toDateString() . '.docx';

        $nomeDoDiretorio = 'documentos';

        // Verificar se a pasta já existe
        if (!Storage::exists($nomeDoDiretorio)) {
            // Criar a pasta
            Storage::makeDirectory($nomeDoDiretorio);
        }
        // Salva o documento em um arquivo
        $caminhoDoArquivoGerado = storage_path('app/public/documentos/' . $nomeDoArquivo);
        $documentoWord->save($caminhoDoArquivoGerado);

        // Retorna o arquivo para download
        return response()->download($caminhoDoArquivoGerado)->deleteFileAfterSend(true);
    }

    /**
     * Gerar documento .docx com todos os Ensaios Metrologicos selecionados
     *
     * @param  int  $id
     * @return $caminhoDoArquivoGerado
     */
    public static function gerarDocumento($ids)
    {
        \PhpOffice\PhpWord\Settings::setDefaultPaper('A4');
        // Cria uma instância do PhpWord
        $documentoWord = new PhpWord();

        foreach ($ids as $id) {
            self::adicionarPagina($id, $documentoWord);
        }

        // Define o nome do arquivo
        $nomeDoArquivo = 'CRLV_digital_' . Carbon::now()->toDateString() . '.docx';

        $nomeDoDiretorio = 'documentos';

        // Verificar se a pasta já existe
        if (!Storage::exists($nomeDoDiretorio)) {
            // Criar a pasta
            Storage::makeDirectory($nomeDoDiretorio);
        }
        // Salva o documento em um arquivo
        $caminhoDoArquivoGerado = storage_path('app/public/documentos/' . $nomeDoArquivo);
        $documentoWord->save($caminhoDoArquivoGerado);

        // Retorna o arquivo para download
        return $caminhoDoArquivoGerado;
    }


    /**
     * Adicionar página no .docx
     *
     * @param  int  $id
     * @param  PhpOffice\PhpWord\PhpWord  $documentoWord
     */
    public static function adicionarPagina($id, $documentoWord)
    {
        // Cria uma seção no documento
        $section = $documentoWord->addSection();

        // Define as configurações da página
        $section->getStyle()
            ->setMarginTop(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2))
            ->setMarginRight(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2))
            ->setMarginBottom(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2))
            ->setMarginLeft(\PhpOffice\PhpWord\Shared\Converter::cmToTwip(2));

        $ensaioMetrologico = \App\Models\EnsaioMetrologico::find($id);
        // Adiciona a foto do CLVR ao documento
        $imagem = public_path('storage/' . $ensaioMetrologico->foto_documento);
        // Obtém as dimensões da imagem
        list($largura, $altura) = getimagesize($imagem);

        // Calcula a largura desejada em pixels
        $larguraDocumento = $section->getStyle()->getPageSizeW() - $section->getStyle()->getMarginLeft() - $section->getStyle()->getMarginRight();
        $larguraDaImagem = (self::twipToPoint($larguraDocumento) * 1);

        // Calcula a proporção para redimensionar a imagem
        $proporcao = $largura / $altura;
        $alturaDaImagem = $larguraDaImagem / $proporcao;

        // Adiciona a imagem ao documento com as dimensões calculadas
        $section->addImage($imagem, [
            'width' => $larguraDaImagem,
            'height' => $alturaDaImagem,
            'align' => 'center'
        ]);

        // Adiciona a foto do Cronotacografo ao documento
        $imagem = public_path('storage/' . $ensaioMetrologico->foto_cronotacografo);
        // Obtém as dimensões da imagem
        list($largura, $altura) = getimagesize($imagem);

        $alturaDocumento = $section->getStyle()->getPageSizeH() - $section->getStyle()->getMarginTop() - $section->getStyle()->getMarginBottom() - $alturaDaImagem;
        $alturaDaImagem = (self::twipToPoint($alturaDocumento) * 0.9) - $alturaDaImagem;
        $proporcao = $largura / $altura;
        // $larguraDaImagem = $alturaDaImagem / $proporcao;

        $section->addImage($imagem, [
            'width' => $larguraDaImagem,
            'height' => $alturaDaImagem,
            'align' => 'center'
        ]);
    }

    /**
     * Converter unidade twip em point
     *
     * @param  int  $twip
     * @return int $point
     */
    static function twipToPoint($twip)
    {
        return $twip / 20;
    }
}
