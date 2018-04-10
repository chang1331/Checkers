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
        Image[,] im = new Image[8, 8];
        Image[,] fichas = new Image[8, 8];
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

            /*for (int i = 0; i < 8; i++)
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
                            pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\cB.jpg");
                        }
                        else
                        {
                            if (j < 3)
                                pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\descarga.png");
                            else if (j > 4)
                                pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\descargaFN.png");
                            else
                                pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\cC.jpg");
                            
                        }
                       

                    }
                    else
                    {
                        if (j % 2 == 0)
                        {
                            if(j<3)
                                pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\descarga.png");
                            else if (j > 4)
                                pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\descargaFN.png");
                            else 
                                pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\cC.jpg");
                                //pb[i,j].BackgroundImage = Bitmap.FromFile(@".\Imagenes\descarga.png");


                        }
                        else
                        {
                                pb[i, j].BackgroundImage = Image.FromFile(@".\Imagenes\cB.jpg");
                        }
                        
                    }

                    Pcanvas.Controls.Add(pb[i, j]);
                    
                }
            } */

          
        }

        private void btnJugar_Click(object sender, EventArgs e)
        {

        }

        private void Pcanvas_Paint(object sender, PaintEventArgs e)
        {
            for (int i = 0; i < 8; i++)
            {
                for (int j = 0; j < 8; j++)
                {
                    /*pb[i, j] = new PictureBox();
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
                    fichas[i, j].BringToFront();*/

                    if (i % 2 == 0)
                    {
                        if (j % 2 == 0)
                        {
                            im[i, j] = Image.FromFile(@".\Imagenes\cB.jpg");
                            e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                        }
                        else
                        {
                            if (j < 3)
                            {
                                im[i, j] = Image.FromFile(@".\Imagenes\cC.jpg");
                                fichas[i, j] = Image.FromFile(@".\Imagenes\blanca.png");
                                e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                                e.Graphics.DrawImage(fichas[i, j], i * 70 + 35, j * 70 + 35, 60, 60);
                            }
                            else if (j > 4)
                            {
                                im[i, j] = Image.FromFile(@".\Imagenes\cC.jpg");
                                fichas[i, j] = Image.FromFile(@".\Imagenes\negra2.png");
                                e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                                e.Graphics.DrawImage(fichas[i, j], i * 70 + 35, j * 70 + 35, 60, 60);
                            }
                            else
                            {
                                im[i, j] = Image.FromFile(@".\Imagenes\cC.jpg");
                                e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                            }

                        }


                    }
                    else
                    {
                        if (j % 2 == 0)
                        {
                            if (j < 3)
                            {
                                im[i, j] = Image.FromFile(@".\Imagenes\cC.jpg");
                                fichas[i, j] = Image.FromFile(@".\Imagenes\blanca.png");
                                e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                                e.Graphics.DrawImage(fichas[i, j], i * 70 + 35, j * 70 + 35, 60, 60);
                            }
                            else if (j > 4)
                            {
                                im[i, j] = Image.FromFile(@".\Imagenes\cC.jpg");
                                fichas[i, j] = Image.FromFile(@".\Imagenes\negra2.png");
                                e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                                e.Graphics.DrawImage(fichas[i, j], i * 70 + 35, j * 70 + 35, 60, 60);
                            }
                            else
                            {
                                im[i, j] = Image.FromFile(@".\Imagenes\cC.jpg");
                                e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                            }
                            //pb[i,j].BackgroundImage = Bitmap.FromFile(@".\Imagenes\descarga.png");


                        }
                        else
                        {
                            im[i, j] = Image.FromFile(@".\Imagenes\cB.jpg");
                            e.Graphics.DrawImage(im[i, j], i * 70 + 30, j * 70 + 30, 70, 70);
                        }

                    }

                    Pcanvas.Controls.Add(pb[i, j]);

                }
            }

        }
    }
}
