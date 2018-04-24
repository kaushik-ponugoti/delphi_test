unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn_model: TButton;
    btn_modelless: TButton;
    txb_name: TEdit;
    procedure btn_modelClick(Sender: TObject);
    procedure btn_modellessClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3;

procedure TForm1.btn_modelClick(Sender: TObject);
begin
     form_model.Show;
     form_model.lb_name1.Caption := txb_name.Text;
     Hide;
end;

procedure TForm1.btn_modellessClick(Sender: TObject);
begin
     form_modelless.Show;
     form_modelless.lb_name2.Caption := txb_name.Text;
end;

end.
