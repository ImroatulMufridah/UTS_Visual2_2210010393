object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 319
  Width = 408
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'E:\fidah uniska\SEMESTER 4\Visual 2\UTS\libmysql.dll'
    Left = 80
    Top = 32
  end
  object Zsatuan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    Left = 80
    Top = 104
  end
  object dssatuan: TDataSource
    DataSet = Zsatuan
    Left = 136
    Top = 112
  end
end
