unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tform_homepage = class(TForm)
    Label1: TLabel;
    lb_uname: TLabel;
    btn_signout: TButton;
    procedure btn_signoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_homepage: Tform_homepage;

implementation

{$R *.dfm}

uses remote_functionality_test;

procedure Tform_homepage.btn_signoutClick(Sender: TObject);
begin
    Form5.Show;
    Close();
end;

end.
