object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Predictor de texto'
  ClientHeight = 379
  ClientWidth = 1069
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Texto: TMemo
    Left = 191
    Top = 37
    Width = 870
    Height = 334
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Pitch = fpFixed
    Font.Style = [fsBold]
    Font.Quality = fqAntialiased
    Lines.Strings = (
      'Texto')
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 191
    Top = 346
    Width = 870
    Height = 25
    Caption = 'Borrar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Palabras: TComboBox
    Left = 8
    Top = 37
    Width = 169
    Height = 21
    AutoComplete = False
    AutoCompleteDelay = 100
    BiDiMode = bdLeftToRight
    Color = clCream
    DragMode = dmAutomatic
    DropDownCount = 5
    MaxLength = 50
    ParentBiDiMode = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TextHint = 'Escriba aqu'#237'...'
    OnKeyPress = PalabrasKeyPress
    OnKeyUp = PalabrasKeyUp
  end
  object Button2: TButton
    Left = 8
    Top = 193
    Width = 169
    Height = 88
    Caption = 'Mostrar arbol'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 287
    Width = 169
    Height = 83
    Caption = 'Ver diccionario'
    TabOrder = 4
    OnClick = Button3Click
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 14
    Width = 219
    Height = 17
    Caption = 'Presione ESPACIO para confirmar la palabra.'
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 432
    Top = 14
    Width = 634
    Height = 17
    Caption = 
      'A medida que se ingresen palabras, el diccionario se ir'#225' cargand' +
      'o y se le ir'#225'n sugiriendo palabras acordes a lo que est'#225' escribi' +
      'endo.'
    TabOrder = 6
  end
end
