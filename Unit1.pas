unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    dbgrd1: TDBGrid;
    edt3: TEdit;
    lbl3: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure posisiawal;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure edt3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a : string;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
//kode simpan
  if edt1.Text = '' then
  begin
    ShowMessage('Nama satuan tidak boleh kosong');
  end
  else if DataModule2.Zsatuan.Locate('name', edt1.Text, []) then
  begin
    ShowMessage('Nama Satuan ' + edt1.Text + ' sudah ada dalam sistem');
  end
  else
  begin
    with DataModule2.Zsatuan do
    begin
      Insert;
      SQL.Clear;
      SQL.Add('INSERT INTO satuan VALUES (NULL, "' + edt1.Text + '", "' + edt2.Text + '")');
      ExecSQL;
      SQL.Clear;
      SQL.Add('SELECT * FROM satuan');
      Open;
    end;
    ShowMessage('Data berhasil disimpan');
  end;
  posisiawal;
end;

procedure TForm1.posisiawal;
begin
edt1.Clear;
edt2.Clear;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
//kode update
  if edt1.Text = '' then
begin
  ShowMessage('Nama Satuan tidak boleh kosong');
end
else if (edt1.Text = DataModule2.Zsatuan.FieldByName('name').AsString) and (edt2.Text = DataModule2.Zsatuan.FieldByName('diskripsi').AsString) then
begin
  ShowMessage('Nama Satuan ' + edt1.Text + ' dan deskripsi tidak mengalami perubahan');
end
else
begin
  with DataModule2.Zsatuan do
  begin
    SQL.Clear;
    SQL.Add('UPDATE satuan SET name="' + edt1.Text + '", diskripsi="' + edt2.Text + '" WHERE id="' + a + '"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('SELECT * FROM satuan');
    Open;
  end;
  ShowMessage('Data berhasil disimpan');
end;
posisiawal;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
//kode delete
if MessageDlg('Apakah Anda Yakin Menghapus Data Ini',mtWarning,[mbYes,mbNo],0)=mryes then
begin
with DataModule2.Zsatuan do
begin
     SQL.Clear;
     SQL.Add('delete from satuan where id="'+a+'"');
     ExecSQL;

     SQL.Clear;
     SQL.Add('select * from satuan');
     Open;
end;
   ShowMessage('Data Berhasil DiDelete!');
end else
begin
  ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
// batal
edt1.Text := '';
edt2.Text := '';
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text:=DataModule2.Zsatuan.Fields[1].AsString;
edt2.Text:=DataModule2.Zsatuan.Fields[2].AsString;
a:= DataModule2.Zsatuan.Fields[0].AsString;
end;

procedure TForm1.edt3Change(Sender: TObject);
begin
//kode search
begin
with DataModule2.Zsatuan do
begin
  SQL.Clear;
  SQL.Add('select * from satuan where name like"%'+edt3.Text+'%"');
  Open;
end;
end;
posisiawal;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiawal;
end;

end.
