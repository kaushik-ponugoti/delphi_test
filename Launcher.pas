unit Launcher;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ShellApi, Vcl.ExtCtrls, Vcl.StdCtrls,IdHTTP, IdGlobal, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, Unit6, System.RegularExpressions, UrlMon;

type
  Tform_launcher = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure timer_tick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure on_Enter(Sender: TObject; var Key: Char);
    procedure TrayIcon1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_launcher: Tform_launcher;

implementation

{$R *.dfm}

procedure Tform_launcher.Button1Click(Sender: TObject);
var H : HWND;
begin
   H := FindWindow(nil,'Login');
   if H <> 0 then
      PostMessage(H, WM_CLOSE, 0 , 0)
   else
   begin
      ShowMessage('WERP not found but closing the current form');
   end;
   Application.Terminate;
end;

procedure Tform_launcher.FormCreate(Sender: TObject);
//var launch_result : string;
begin
    //launch_result:= Launch_WERP();
    //Application.MainFormOnTaskbar := False;
    ShellExecute(0, 'open','C:\Users\Kaushik\Documents\Embarcadero\Studio\Projects\Win32\Debug\Project2.exe', nil, nil, SW_SHOWNORMAL) ;
end;

procedure Tform_launcher.on_Enter(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Button1.Click;
end;

procedure Tform_launcher.timer_tick(Sender: TObject);
  var
   H, H1 : HWND;
   HTTP, HTTP_status:                  TIdHTTP;   // http variables
   RequestBody, RequestBody_status:    TStream;   // server request
   ResponseBody, ResponseBody_status:  string;    // server response
   id, r_flag, s_flag, version:        TextFile;  // paths for local files
   s_id:                               String;    // id
   l_r_flag, l_s_flag, l_version:      String;    // LOCAL reboot, shutdown flag and version
   s_r_flag, s_s_flag, s_version:      String;    // SERVER reboot, shutdown flag and version
   file_update :                       TextFile;  // Update File
   SourceString, DestinationString:    string;    // URL and path to download updated file

 begin
   // READING LOCAL DATA
   // assign files to the TextFile
   assignFile(id,'C:\Users\Kaushik\test\app_id.txt');
   assignFile(r_flag,'C:\Users\Kaushik\test\app_reboot_flag.txt');
   assignFile(s_flag,'C:\Users\Kaushik\test\app_shutdown_flag.txt');
   assignFile(version,'C:\Users\Kaushik\test\app_version.txt');
   assignFile(file_update,'C:\Users\Kaushik\test\updated_file.txt');

   // Open files to read
   reset(id);
   reset(r_flag);
   reset(s_flag);
   reset(version);

   // Read files into following variables
   read(id,s_id);
   read(r_flag,l_r_flag);
   read(s_flag,l_s_flag);
   read(version,l_version);

   //ShowMessage('ID : ' + s_id + ' LOCAL Reboot Flag : ' + l_r_flag + ' LOCAL Shutdown Flag : ' + l_s_flag + ' LOCAL Version : ' + l_version) ;

   // READING SERVER DATA
   HTTP:= tiDhttp.Create;
   RequestBody := TStringStream.Create(nil);
   ResponseBody := HTTP.Get('http://localhost:8045/search/' + s_id);
   ResponseBody := TRegex.Replace(ResponseBody,'\D','');

   s_r_flag  := ResponseBody[1];
   s_s_flag  := ResponseBody[2];
   s_version := ResponseBody[3];

   //ShowMessage('ID : ' + s_id + ' SERVER Reboot Flag : ' + s_r_flag + ' SERVER Shutdown Flag : ' + s_s_flag + ' SERVER Version : ' +s_version) ;
   RequestBody.Free;
   HTTP.Free;

   // CHECK REBOOT FLAG
   if (l_r_flag <> s_r_flag) then
   begin
     ReWrite(r_flag);
     WriteLn(r_flag,s_r_flag);
     CloseFile(r_flag);
     // Terminate WERP
      H := FindWindow(nil,'Login');
      if H <> 0 then
        PostMessage(H, WM_CLOSE, 0 , 0)
      else
      begin
        ShowMessage('WERP not found');
      end;

      // Run WERP
     ShellExecute(0, 'open','C:\Users\Kaushik\Documents\Embarcadero\Studio\Projects\Win32\Debug\Project2.exe', nil, nil, SW_SHOWNORMAL) ;

   end
   else
   begin
     CloseFile(r_flag);
   end;

   // CHECK SHUTDOWN FLAG
   if (l_s_flag <> s_s_flag) then
   begin
     ReWrite(s_flag);
     WriteLn(s_flag,s_s_flag);
     CloseFile(s_flag);
     // Terminate WERP
      H1 := FindWindow(nil,'Login');
      if H1 <> 0 then
        PostMessage(H1, WM_CLOSE, 0 , 0)
      else
      begin
        ShowMessage('WERP not found');
      end;
   end
   else
   begin
     CloseFile(s_flag);
   end;

   // CHECK UPDATE VERSION
   if (l_version <> s_version) then
   begin
     ReWrite(version);
     WriteLn(version,s_version);
     CloseFile(version);
     // DeleteFile('path');
     SourceString := 'http://storage.ezdigitalboard.com/test_tobedeleted.txt';
     DestinationString := 'C:\Users\Kaushik\test\updated_file.txt';
     if URLDownloadToFile(nil, PChar(SourceString), PChar(DestinationString), 0, nil) <> 0 then
     ShowMessage('Error downloading ' + SourceString);
   end
   else
   begin
     CloseFile(version);
   end;



   // SEND HEARTBEAT
   HTTP_status:= tiDhttp.Create;
   RequestBody_status := TStringStream.Create(nil);
   ResponseBody_status := HTTP_status.Get('http://localhost:8045/app-status/' + s_id + '/' + l_version + '/' + l_r_flag + '/' + l_s_flag + '/');
   //ShowMessage(ResponseBody_status);
   RequestBody_status.Free;
   HTTP_status.Free;

   //Close All the Open Files
 end;

 procedure Tform_launcher.TrayIcon1Click(Sender: TObject);
begin
   form_launcher.Show;
end;

// FUNCTION TO LAUNCH WERP
// function Launch_WERP(nil);
// begin
//     ShellExecute(0, 'open','C:\Users\Kaushik\Documents\Embarcadero\Studio\Projects\Win32\Debug\Project2.exe', nil, nil, SW_SHOWNORMAL) ;
// end;
end.
