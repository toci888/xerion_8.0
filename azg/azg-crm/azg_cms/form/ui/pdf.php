<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'lib/fpdf.php');
    define('FPDF_FONTPATH', $path.'lib/font/'); 
    
    class PdfLista
    {
        protected $tlumaczenia;
        protected $jezyk;
        protected $plik_pdf;
        protected $plik_nazwa;
        protected $katalog = '../tmp/listy_wsk/';
        protected $osY;
        protected $lewaX = 20;
        protected $prawaX = 190;
        protected $srodekX = 105;
        protected $grubaLinia = 0.5;
        protected $cienkaLinia = 0.25;
        protected $pionowaLinia = 0.25;
        //dane txt
        private $biuroNazwa = 'A.Z. GWARANCJA';
        private $wlasciciel = 'Andrzej Zapart';
        private $licencja = '3125';
        private $mail = 'azgwarancja@azg.pl';
        private $www = 'www.azg.pl';
        
        public function PdfLista($id_agent, $id_zapotrzebowanie, $id_jezyk)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            $this->tlumaczenia= cachejezyki::Czytaj();
            $this->jezyk = $id_jezyk;
            $this->plik_nazwa = $id_zapotrzebowanie.'.pdf';
            $this->katalog .= $id_agent.'/';
            $this->plik_pdf = new FPDF();
            $this->plik_pdf->open();
            $this->plik_pdf->setCompression(true);
            $this->plik_pdf->addPage();
            $this->plik_pdf->AddFont('times', '', 'fpdf_times/times.php');
            $this->plik_pdf->setFont('times', '', 10);
            $this->plik_pdf->SetRightMargin($this->prawaX);
            $this->plik_pdf->SetLeftMargin($this->lewaX);
            //wlozenie logo firmy
            $this->plik_pdf->Image('../../zdj/logo_l.jpg', $this->lewaX, 20, 50, 25);
            //
            $tresc = strtoupper($this->tlumaczenia->Tlumacz($this->jezyk, tags::$biuro_nieruchomosci).' '.$this->biuroNazwa);
            $pozX = $this->prawaX - $this->plik_pdf->GetStringWidth($tresc);
            $this->plik_pdf->Text($pozX, 25, $tresc);
            $this->plik_pdf->SetLineWidth($this->grubaLinia);
            $this->plik_pdf->Line($this->lewaX, 50, $this->prawaX, 50);
            
            $this->plik_pdf->setFont('times', '', 12);
            $this->plik_pdf->Ln(5);
            $naglowek = strtoupper($this->tlumaczenia->Tlumacz($this->jezyk, tags::$lista_wskazan_adresowych).' '.$this->tlumaczenia->Tlumacz($this->jezyk, tags::$numer).' '.$id_zapotrzebowanie.'.');
            $il_zn = $this->plik_pdf->GetStringWidth($naglowek);
            $this->plik_pdf->Text($this->srodekX - ($il_zn / 2), 60, $naglowek);
                               //wide, high           //1 - reset x, > 0 next line - y w dol
            $this->plik_pdf->Cell(1, 60, '', 0, 1);
            //powyzsza linijka odsuwa budowanie tabeli
            $this->plik_pdf->setFont('times', '', 10);
            //$this->plik_pdf->MultiCell(10, 6, 'fdsafd', 5);
            //$this->plik_pdf->WriteHTML('<table border="1"><tr><td nowrap>dsadsa</td><td>fdafadsgurfghfughdfughfughdsufighfsdiugsfdighdhfhuiigi</td></tr></table>');
            
            //$this->plik_pdf->Cell(10, 10, 'test', 1);
            //$this->plik_pdf->Cell(10, 10, 'test2', 1);
 
            if (!is_dir($this->katalog))
            {
                mkdir($this->katalog, 0755, true);
            }
        }
        
        public function DodajDaneListaWskazan($naglowki, $dane)
        {
            
        }
        
        public function Zapisz()
        {
            $this->plik_pdf->Output($this->katalog.$this->plik_nazwa);
            return $this->katalog.$this->plik_nazwa;
        }
    } 
?>