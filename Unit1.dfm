object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 216
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn_model: TButton
    Left = 40
    Top = 128
    Width = 233
    Height = 65
    Caption = 'Model '
    TabOrder = 0
    OnClick = btn_modelClick
  end
  object btn_modelless: TButton
    Left = 320
    Top = 128
    Width = 233
    Height = 65
    Caption = 'Modelless'
    ModalResult = 2
    TabOrder = 1
    OnClick = btn_modellessClick
  end
  object txb_name: TEdit
    Left = 168
    Top = 48
    Width = 265
    Height = 41
    TabOrder = 2
  end
end
