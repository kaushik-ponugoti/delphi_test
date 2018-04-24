object form_homepage: Tform_homepage
  Left = 0
  Top = 0
  Caption = 'Home Page'
  ClientHeight = 130
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 24
    Width = 72
    Height = 13
    Caption = 'Current User : '
  end
  object lb_uname: TLabel
    Left = 278
    Top = 24
    Width = 3
    Height = 13
  end
  object btn_signout: TButton
    Left = 168
    Top = 72
    Width = 177
    Height = 33
    Caption = 'SignOut'
    TabOrder = 0
    OnClick = btn_signoutClick
  end
end
