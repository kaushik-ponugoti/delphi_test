unit remote_functionality_test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, IdHTTP, IdGlobal, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, Unit6, System.RegularExpressions, ShellApi, UrlMon;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    tb_access_code: TEdit;
    tb_uname: TEdit;
    tb_pwd: TEdit;
    btn_login: TButton;
    Timer1: TTimer;
    procedure btn_loginClick(Sender: TObject);
    procedure timer_tick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.btn_loginClick(Sender: TObject);

        var
        HTTP: TIdHTTP;
        RequestBody: TStream;
        ResponseBody: string;
begin
    if (Length(tb_access_code.Text) = 0) or
       (Length(tb_uname.Text) = 0) or
       (Length(tb_pwd.Text) = 0)
       then
       begin
          ShowMessage('Empty Fields are not allowed.');
       end
    else

        begin
            HTTP := TIdHTTP.Create;
            RequestBody := TStringStream.Create('{"req_data_length":1,"req_data":[{"id":"'+tb_uname.Text+'","pw":"'+tb_pwd.Text+'"}]}',
            TEncoding.UTF8);

            HTTP.Request.Accept := 'application/json';
            HTTP.Request.ContentType := 'application/json';
            ResponseBody := HTTP.Post('https://wrp-api.posmasterus.com/wsdb/wholesale/submaster-user/login/smcode/' + tb_access_code.Text,
            RequestBody);
            // ShowMessage(ResponseBody);
            // ShowMessage(HTTP.ResponseText);
            RequestBody.Free;
            HTTP.Free;

            if (ResponseBody.Contains('true'))
             then
             begin
                form_homepage.Show;
                form_homepage.lb_uname.Caption := Form5.tb_uname.Text;
                Hide();
             end
             else
               begin
                   ShowMessage('Incorrect Credentials. Please try again');
               end;
        end;

end;


// COMMUNICATING AND SENDING STATUS TO THE SERVER PERIODICALLY
procedure TForm5.timer_tick(Sender: TObject);

// var
//   HTTP, HTTP_status:                  TIdHTTP;   // http variables
//   RequestBody, RequestBody_status:    TStream;   // server request
//   ResponseBody, ResponseBody_status:  string;    // server response
//   id, r_flag, s_flag, version:        TextFile;  // paths for local files
//   s_id:                               String;    // id
//   l_r_flag, l_s_flag, l_version:      String;    // LOCAL reboot, shutdown flag and version
//   s_r_flag, s_s_flag, s_version:      String;    // SERVER reboot, shutdown flag and version
//   file_update :                       TextFile;  // Update File
//   SourceString, DestinationString:    string;    // URL and path to download updated file

 begin
//   // READING LOCAL DATA
//   // assign files to the TextFile
//   assignFile(id,'C:\Users\Kaushik\test\app_id.txt');
//   assignFile(r_flag,'C:\Users\Kaushik\test\app_reboot_flag.txt');
//   assignFile(s_flag,'C:\Users\Kaushik\test\app_shutdown_flag.txt');
//   assignFile(version,'C:\Users\Kaushik\test\app_version.txt');
//   assignFile(file_update,'C:\Users\Kaushik\test\updated_file.txt');
//
//   // Open files to read
//   reset(id);
//   reset(r_flag);
//   reset(s_flag);
//   reset(version);
//
//   // Read files into following variables
//   read(id,s_id);
//   read(r_flag,l_r_flag);
//   read(s_flag,l_s_flag);
//   read(version,l_version);
//
//   //ShowMessage('ID : ' + s_id + ' LOCAL Reboot Flag : ' + l_r_flag + ' LOCAL Shutdown Flag : ' + l_s_flag + ' LOCAL Version : ' + l_version) ;
//
//   // READING SERVER DATA
//   HTTP:= tiDhttp.Create;
//   RequestBody := TStringStream.Create(nil);
//   ResponseBody := HTTP.Get('http://localhost:8045/search/' + s_id);
//   ResponseBody := TRegex.Replace(ResponseBody,'\D','');
//
//   s_r_flag  := ResponseBody[1];
//   s_s_flag  := ResponseBody[2];
//   s_version := ResponseBody[3];
//
//   //ShowMessage('ID : ' + s_id + ' SERVER Reboot Flag : ' + s_r_flag + ' SERVER Shutdown Flag : ' + s_s_flag + ' SERVER Version : ' +s_version) ;
//   RequestBody.Free;
//   HTTP.Free;
//
//   // CHECK REBOOT FLAG
//   if (l_r_flag <> s_r_flag) then
//   begin
//     ReWrite(r_flag);
//     WriteLn(r_flag,s_r_flag);
//     CloseFile(r_flag);
//     //Start a windows application and terminate current application
//     Application.Terminate;
//   end;
//
//   // CHECK SHUTDOWN FLAG
//   if (l_s_flag <> s_s_flag) then
//   begin
//     ReWrite(s_flag);
//     WriteLn(s_flag,s_s_flag);
//     CloseFile(s_flag);
//     Application.Terminate;
//   end;
//
//   // CHECK UPDATE VERSION
//   if (l_version <> s_version) then
//   begin
//     ReWrite(version);
//     WriteLn(version,s_version);
//     CloseFile(version);
//     // DeleteFile('path');
//     SourceString := 'http://storage.ezdigitalboard.com/test_tobedeleted.txt';
//     DestinationString := 'C:\Users\Kaushik\test\updated_file.txt';
//     if URLDownloadToFile(nil, PChar(SourceString), PChar(DestinationString), 0, nil) <> 0 then
//     ShowMessage('Error downloading ' + SourceString);
//   end;
//
//
//
//   // SEND HEARTBEAT
//   HTTP_status:= tiDhttp.Create;
//   RequestBody_status := TStringStream.Create(nil);
//   ResponseBody_status := HTTP_status.Get('http://localhost:8045/app-status/' + s_id + '/' + l_version + '/' + l_r_flag + '/' + l_s_flag + '/');
//   //ShowMessage(ResponseBody_status);
//   RequestBody_status.Free;
//   HTTP_status.Free;
 end;



// // Function to Download File from URL
// function DownLoadFile(Source, Dest : String): Boolean;
// begin
//   try
//     Result := URLDownloadToFile(nil,PChar(Source),PChar(Dest),0,nil) = 0
//   except
//     Result := False;
//   end;
// end;
end.

