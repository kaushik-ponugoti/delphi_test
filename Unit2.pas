unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tform_model = class(TForm)
    Label1: TLabel;
    lb_name1: TLabel;
    btn_back: TButton;
    procedure btn_backClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_model: Tform_model;

implementation

{$R *.dfm}

uses Unit1;

procedure Tform_model.btn_backClick(Sender: TObject);
begin
     form1.Show;
     Close;
end;

end.
