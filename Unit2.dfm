object form_model: Tform_model
  Left = 0
  Top = 0
  Caption = 'form_model'
  ClientHeight = 153
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 64
    Width = 38
    Height = 13
    Caption = 'NAME : '
  end
  object lb_name1: TLabel
    Left = 152
    Top = 64
    Width = 3
    Height = 13
  end
  object btn_back: TButton
    Left = 144
    Top = 104
    Width = 113
    Height = 33
    Caption = 'BACK'
    TabOrder = 0
    OnClick = btn_backClick
  end
end
