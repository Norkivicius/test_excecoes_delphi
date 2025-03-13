object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 221
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 73
    Width = 33
    Height = 13
    Caption = 'Valor 2'
  end
  object Valor1: TLabel
    Left = 64
    Top = 22
    Width = 33
    Height = 13
    Caption = 'Valor 1'
  end
  object Label3: TLabel
    Left = 64
    Top = 122
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object EdtValor1: TEdit
    Left = 64
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdtValor2: TEdit
    Left = 64
    Top = 92
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 64
    Top = 177
    Width = 121
    Height = 25
    Caption = 'Divis'#227'o'
    TabOrder = 3
    OnClick = Button1Click
  end
  object EdtResultado: TEdit
    Left = 64
    Top = 141
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 196
    Top = 29
  end
end
