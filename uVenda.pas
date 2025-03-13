unit uVenda;

interface

uses
  System.Generics.Collections, System.SysUtils, uVendaItem,
  uEVendaInvalida;
Type

  TVenda = class
  private
    FIDVenda: Integer;
    FData: TDateTime;
    FListaVendaItem: TObjectList<TVendaItem>;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property IDVenda: Integer read FIDVenda write FIDVenda;
    property Data   : TDateTime read FData write FData;
    property ListaVendaItem: TObjectList<TVendaItem> read FListaVendaItem write FListaVendaItem;

    constructor Create;
    destructor Destroy; override;

    procedure AdicionarVendaItem(_VendaItem: TVendaItem);
    function CalcularTotalVenda: Real;
  published
    { published declarations }
  end;

implementation

{ TVenda }

procedure TVenda.AdicionarVendaItem(_VendaItem: TVendaItem);
begin
  if not Assigned(_VendaItem) then
    raise EVendaInvalida.Create('Não é permitido adicionar um item nulo.');
  FListaVendaItem.Add(_VendaItem);
end;

function TVenda.CalcularTotalVenda: Real;
var
  I: Integer;
  _Total: Real;
begin
  _Total := 0;
  for I := 0 to FListaVendaItem.Count -1 do
  begin
    _Total := _Total + FListaVendaItem.Items[I].Preco;
  end;
  Result := _Total;
end;

constructor TVenda.Create;
begin
  FIDVenda        := 0;
  FData           := EncodeDate(1900,1,1);
  FListaVendaItem := TObjectList<TVendaItem>.Create;
end;

destructor TVenda.Destroy;
begin
  FreeAndNil(FListaVendaItem);
  inherited;
end;

end.
