object Form1: TForm1
  Left = 192
  Top = 125
  Width = 928
  Height = 480
  Caption = 'SATUAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 152
    Top = 48
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl2: TLabel
    Left = 152
    Top = 88
    Width = 50
    Height = 13
    Caption = 'DISKRIPSI'
  end
  object lbl3: TLabel
    Left = 144
    Top = 312
    Width = 86
    Height = 13
    Caption = 'MASUKKAN NAMA'
  end
  object edt1: TEdit
    Left = 248
    Top = 48
    Width = 385
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 248
    Top = 88
    Width = 385
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 248
    Top = 128
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 352
    Top = 128
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 456
    Top = 128
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 560
    Top = 128
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 5
    OnClick = btn4Click
  end
  object dbgrd1: TDBGrid
    Left = 248
    Top = 176
    Width = 385
    Height = 120
    DataSource = DataModule2.dssatuan
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'diskripsi'
        Width = 300
        Visible = True
      end>
  end
  object edt3: TEdit
    Left = 248
    Top = 312
    Width = 393
    Height = 21
    TabOrder = 7
    OnChange = edt3Change
  end
end
