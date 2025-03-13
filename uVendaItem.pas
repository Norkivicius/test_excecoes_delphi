unit uVendaItem;

interface

Type

  TVendaItem = class
  private
    FIDVenda: Integer;
    FProduto: String;
    FPreco: Real;
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property IDVenda: Integer read FIDVenda write FIDVenda;
    property Produto: string read FProduto write FProduto;
    property Preco: Real read FPreco write FPreco;
  published
    { published declarations }
  end;

implementation

{ TVendaItem }


{ TVendaItem }

end.
