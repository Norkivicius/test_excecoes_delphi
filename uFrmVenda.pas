unit uFrmVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uVenda, uVendaItem, Vcl.StdCtrls,uEVendaInvalida;

type
  TFrmVenda = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVenda: TFrmVenda;

implementation

{$R *.dfm}

procedure TFrmVenda.Button1Click(Sender: TObject);
var
  tempVenda: TVenda;
  tempVendaItem: TVendaItem;
begin
  try
    try
      tempVenda         := TVenda.Create;
      tempVenda.IDVenda := 1;
      tempVenda.Data    := Now;

      //Produto 1
      tempVendaItem := TVendaItem.Create;
      tempVendaItem.IDVenda := tempVenda.IDVenda;
      tempVendaItem.Preco   := 3000;
      tempVendaItem.Produto := 'Notebook';
      tempVenda.AdicionarVendaItem(tempVendaItem);

      //Produto 2
      tempVendaItem := TVendaItem.Create;
      tempVendaItem.IDVenda := tempVenda.IDVenda;
      tempVendaItem.Preco   := 40;
      tempVendaItem.Produto := 'Mouse';
      tempVenda.AdicionarVendaItem(tempVendaItem);

      tempVenda.AdicionarVendaItem(Nil);
    
      ShowMessage('Total da Venda é: ' + FloatToStr(tempVenda.CalcularTotalVenda));

    except
      on E: EVendaInvalida do
        ShowMessage('Objeto nulo adicionado.' + #13 + 'Erro original: ' +
          E.Message + #13 + 'Classe original: ' + E.ClassName);

      on E: Exception do
        ShowMessage('Ocorreu um erro em nossa aplicação.');

    end;
  finally
    if Assigned(tempVenda) then
      FreeAndNil(tempVenda);
    ShowMessage('Venda Finalizada');

  end;
end;
end.
