using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HW1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            refresh(lblErrorMessage, imgDiscover, imgElectron, imgMaestro, imgMasterCard, imgVisa);
            String cardNumber = txtBoxCardNumber.Text.ToString();
            String cvvNumber = txtBoxCvv.Text.ToString();
            String nameOnCard = txtBoxNameOnCard.Text.ToString();
            String expiryDate = txtBoxExpiryDate.Text.ToString();
            if (cardNumber == "")
            {
                lblErrorMessage.Text = "Please enter all fields!!!";
                return;
            }
            if(!stringIsBlank(lblErrorMessage, cvvNumber, nameOnCard, expiryDate))
            {
                return;
            }
            if (cvvNumber.Length != 3)
            {
                lblErrorMessage.Text = "CVV Number is invalid!!!";
                return;
            }
            if (cardNumber.Length < 12 || cardNumber.Length > 19)
            {
                lblErrorMessage.Text = "Credit card number is invalid!!!";
                return;
            }
            if (!luhnAlgorithm(cardNumber))
            {
                lblErrorMessage.Text = "Credit card number has an inappropriate number of digits!!!";
                return;
            }
            int firstTwoValue = Int32.Parse(cardNumber.Length >= 2 ? cardNumber.Substring(0, 2) : null);
            int firstThreeValue = Int32.Parse(cardNumber.Length >= 3 ? cardNumber.Substring(0, 3) : null);
            int firstFourValue = Int32.Parse(cardNumber.Length >= 4 ? cardNumber.Substring(0, 4) : null);
            int firstSixValue = Int32.Parse(cardNumber.Length >= 6 ? cardNumber.Substring(0, 6) : null);
            if (cardNumber[0] == '4')
            {
                string firstFourChars = cardNumber.Length >= 4 ? cardNumber.Substring(1, 3) : null;
                string firstSixChars = cardNumber.Length >= 6 ? cardNumber.Substring(1, 5) : null;
                // For VisaElectron
                if (cardNumber.Length == 16 && firstFourChars == "026" || firstFourChars == "405" || firstFourChars == "508" 
                    || firstFourChars == "844" || firstFourChars == "913" || firstFourChars == "917" || firstSixChars == "17500")
                {
                    imgVisiblityFalse(imgDiscover, imgVisa, imgMaestro, imgMasterCard);
                }
                // For Visa
                else
                {
                    if (cardNumber.Length >= 13 && cardNumber.Length <= 19)
                    {
                        imgVisiblityFalse(imgDiscover, imgElectron, imgMaestro, imgMasterCard);
                    }
                }
            }
            // For MasterCard
            else if (cardNumber.Length == 16 && firstTwoValue >= 51 && firstTwoValue <= 55 
                || firstSixValue >= 222100 && firstSixValue <= 272099)
            {
                imgVisiblityFalse(imgDiscover, imgElectron, imgMaestro, imgVisa);
            }
            // For Maestro
            else if (firstSixValue >= 500000 && firstSixValue <= 509999 || firstSixValue >= 560000 && firstSixValue <= 589999 
                || firstSixValue >= 600000 && firstSixValue <= 699999)
            {
                imgVisiblityFalse(imgDiscover, imgElectron, imgMasterCard, imgVisa);
            }
            // For Discover
            else if (cardNumber.Length == 16 && firstSixValue >= 622126 || firstSixValue <= 622925 || firstFourValue == 6011 
                || firstThreeValue >= 644 && firstThreeValue <= 649 || firstTwoValue == 65)
            {
                imgVisiblityFalse(imgMaestro, imgElectron, imgMasterCard, imgVisa);
            }
            else
            {
                lblErrorMessage.Text = "Unknown card type!!!";
            }
        }

        public void imgVisiblityFalse(params Image[] images)
        {
            foreach (var image in images)
            {
                image.Visible = false;
            }
        }

        public bool stringIsBlank(Label lbl, params String[] strings)
        {
            foreach (var str in strings)
            {
                if (str == "")
                {
                    lbl.Text = "Please enter all fields!!!";
                    return false;
                }
            }
            return true;
        }

        public void refresh(Label lbl, params Image[] images)
        {
            foreach (var image in images)
            {
                image.Visible = true;
            }
            lbl.Text = "";
        }

        public bool luhnAlgorithm(String cardNumber)
        {
            int counter = 0, sum = 0;
            for (int i = cardNumber.Length - 1; i >= 0; i--)
            {
                counter++;
                int digit = Int32.Parse(cardNumber[i].ToString());
                if (counter % 2 == 0)
                {
                    int doubleDigit = digit * 2;
                    if (doubleDigit >= 10)
                    {
                        sum += (doubleDigit / 10) + (doubleDigit % 10);
                    }
                    else
                    {
                        sum += doubleDigit;
                    }
                }
                else
                {
                    sum += digit;
                }
            }
            return sum % 10 == 0;
        }
    }
}