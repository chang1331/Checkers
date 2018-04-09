using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace Checkers
{
    public partial class Form1 : Form
    {
        PictureBox[,] pb = new PictureBox[8, 8];
        PictureBox[,] fichas = new PictureBox[8, 8];
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
                initBoard();
        }

        public void initBoard()
        {

            for (int i = 0; i < 8; i++)
            {
                for (int j = 0; j < 8; j++)
                {
                    pb[i, j] = new PictureBox();
                    pb[i, j].Location = new Point(i * 70 + 30, j * 70 + 30);
                    pb[i, j].Width = 70;
                    pb[i, j].Height = 70;
                    pb[i, j].Visible = true;
                    pb[i, j].BorderStyle = BorderStyle.None;
                    pb[i, j].BringToFront();

                    fichas[i, j] = new PictureBox();
                    fichas[i, j].Location = new Point(i * 70 + 30, j * 70 + 30);
                    fichas[i, j].Width = 70;
                    fichas[i, j].Height = 70;
                    fichas[i, j].Visible = true;
                    fichas[i, j].BorderStyle = BorderStyle.None;
                    fichas[i, j].BringToFront();

                    if (i % 2 == 0)
                    {
                        if (j % 2 == 0)
                        {
                            pb[i, j].BackgroundImage = Image.FromFile(@"C: \Users\Jorge\source\repos\Checkers\Checkers\bin\Debug\Imagenes\cB.jpg");
                        }
                        else
                        {
                            pb[i, j].BackgroundImage = Image.FromFile(@"C: \Users\Jorge\source\repos\Checkers\Checkers\bin\Debug\Imagenes\cC.jpg");
                            
                        }
                       

                    }
                    else
                    {
                        if (j % 2 == 0)
                        {
                            pb[i, j].BackgroundImage = Image.FromFile(@"C: \Users\Jorge\source\repos\Checkers\Checkers\bin\Debug\Imagenes\cC.jpg");
                            

                        }
                        else
                        {
                            pb[i, j].BackgroundImage = Image.FromFile(@"C: \Users\Jorge\source\repos\Checkers\Checkers\bin\Debug\Imagenes\cB.jpg");
                        }
                        
                    }

                    Pcanvas.Controls.Add(pb[i, j]);
                }
            }

          
        }


    }
}
