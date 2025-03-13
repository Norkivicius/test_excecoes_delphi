unit uTesteExcecoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts, System.IOUtils ;

type
  TForm1 = class(TForm)
    EdtValor1: TEdit;
    EdtValor2: TEdit;
    Label1: TLabel;
    Valor1: TLabel;
    Button1: TButton;
    Label3: TLabel;
    EdtResultado: TEdit;
    ApplicationEvents1: TApplicationEvents;
    procedure Button1Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
   function CapturaTela: TBitmap;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  Log: TStringList;
  ImageName: String;
begin
  try
    Log := TStringList.Create;
    try
      if TFile.Exists(FormatDateTime('yyyymmdd', Now) + '.log') then
        Log.LoadFromFile(FormatDateTime('yyyymmdd', Now) + '.log');
      Log.Add('Data: ' + DateToStr(Now));
      Log.Add('Hora: ' + TimeToStr(Now));
      Log.Add('Classe do Erro: ' + E.ClassName);
      Log.Add('Mesagem de erro: ' + E.Message);
      ImageName := FormatDateTime('yyyymmddhhnnss', Now) + '.bmp';
      CapturaTela.SaveToFile(ImageName);
      Log.Add('ScreenShot: '+ImageName);
      Log.Add('');
      Log.SaveToFile(FormatDateTime('yyyymmdd', Now) + '.log');
    except
      MessageDlg('Erro ao gerar log', mtInformation, [mbOK], 0);
    end;
  finally
    FreeAndNil(Log);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  N1, N2, Resultado: Double;
begin
 try
   N1 := StrToFloat(EdtValor1.Text);
   N2 := StrToFloat(EdtValor2.Text);
   Resultado := N1 / N2;
   EdtResultado.Text := FloatToStr(Resultado);
   ShowMessage('Fim da Rotina');
 except
   on E: EConvertError do
      MessageDlg('Erro ao tentar converter os valores.'+#13+
                 'Verifique se os valores informados são válidos',
                 mtInformation,[mbOK],0);
   on E: EZeroDivide do
      MessageDlg('Não é possível efetuar divisão por zero.',
                 mtInformation,[mbOK],0);
   on E: Exception do
   begin
     MessageDlg('Um erro inesperado ocorreu.',mtWarning,[mbOK],0);
     raise Exception.Create(E.Message);
   end;
 end;
 ShowMessage('Fim da Rotina');
end;

function TForm1.CapturaTela: TBitmap;
var
  DC: TCanvasDC;
  CV: TCanvas;
begin
  Result        := TBitmap.Create;
  Result.Width  := Screen.Width;
  Result.Height := Screen.Height;
  DC := GetDC(0);
  CV := TCanvas.Create;
  CV.Handle := DC;
  Result.Canvas.CopyRect(Rect(0,0,Screen.Width,Screen.Height),
         cv,Rect(0,0,Screen.Width,Screen.Height));
  FreeAndNil(cv);
  ReleaseDC(0,DC);
end;

end.
