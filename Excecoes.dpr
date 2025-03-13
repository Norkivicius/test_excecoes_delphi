program Excecoes;

uses
  Vcl.Forms,
  uVendaItem in 'uVendaItem.pas',
  uVenda in 'uVenda.pas',
  uEVendaInvalida in 'uEVendaInvalida.pas',
  uFrmVenda in 'uFrmVenda.pas' {FrmVenda},
  uTesteExcecoes in 'uTesteExcecoes.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
