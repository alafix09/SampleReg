//---------------------------------------------------------------------------

#ifndef UploadFormUnitH
#define UploadFormUnitH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
//---------------------------------------------------------------------------
class TUploadForm : public TForm
{
__published:	// IDE-managed Components
	TButton *OKButton;
	TButton *CancelButton;
	TEdit *SIDEdit;
	TLabel *Label1;
	void __fastcall OKButtonClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TUploadForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TUploadForm *UploadForm;
//---------------------------------------------------------------------------
#endif
