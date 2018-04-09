namespace Checkers
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.Pcanvas = new System.Windows.Forms.Panel();
            this.btnJugar = new System.Windows.Forms.Button();
            this.gbDificultada = new System.Windows.Forms.GroupBox();
            this.rbFacil = new System.Windows.Forms.RadioButton();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.radioButton3 = new System.Windows.Forms.RadioButton();
            this.gbDificultada.SuspendLayout();
            this.SuspendLayout();
            // 
            // Pcanvas
            // 
            this.Pcanvas.BackColor = System.Drawing.Color.PaleVioletRed;
            this.Pcanvas.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("Pcanvas.BackgroundImage")));
            this.Pcanvas.Location = new System.Drawing.Point(100, 100);
            this.Pcanvas.Name = "Pcanvas";
            this.Pcanvas.Size = new System.Drawing.Size(820, 760);
            this.Pcanvas.TabIndex = 0;
            // 
            // btnJugar
            // 
            this.btnJugar.Location = new System.Drawing.Point(1141, 510);
            this.btnJugar.Name = "btnJugar";
            this.btnJugar.Size = new System.Drawing.Size(75, 23);
            this.btnJugar.TabIndex = 1;
            this.btnJugar.Text = "¡Jugar!";
            this.btnJugar.UseVisualStyleBackColor = true;
            // 
            // gbDificultada
            // 
            this.gbDificultada.Controls.Add(this.radioButton3);
            this.gbDificultada.Controls.Add(this.radioButton2);
            this.gbDificultada.Controls.Add(this.rbFacil);
            this.gbDificultada.Location = new System.Drawing.Point(1068, 134);
            this.gbDificultada.Name = "gbDificultada";
            this.gbDificultada.Size = new System.Drawing.Size(200, 100);
            this.gbDificultada.TabIndex = 2;
            this.gbDificultada.TabStop = false;
            this.gbDificultada.Text = "Dificultad";
            // 
            // rbFacil
            // 
            this.rbFacil.AutoSize = true;
            this.rbFacil.Location = new System.Drawing.Point(19, 22);
            this.rbFacil.Name = "rbFacil";
            this.rbFacil.Size = new System.Drawing.Size(58, 21);
            this.rbFacil.TabIndex = 0;
            this.rbFacil.TabStop = true;
            this.rbFacil.Text = "Fácil";
            this.rbFacil.UseVisualStyleBackColor = true;
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(19, 50);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(95, 21);
            this.radioButton2.TabIndex = 1;
            this.radioButton2.TabStop = true;
            this.radioButton2.Text = "Intermedio";
            this.radioButton2.UseVisualStyleBackColor = true;
            // 
            // radioButton3
            // 
            this.radioButton3.AutoSize = true;
            this.radioButton3.Location = new System.Drawing.Point(19, 73);
            this.radioButton3.Name = "radioButton3";
            this.radioButton3.Size = new System.Drawing.Size(62, 21);
            this.radioButton3.TabIndex = 2;
            this.radioButton3.TabStop = true;
            this.radioButton3.Text = "Difícil";
            this.radioButton3.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1294, 690);
            this.Controls.Add(this.gbDificultada);
            this.Controls.Add(this.btnJugar);
            this.Controls.Add(this.Pcanvas);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.gbDificultada.ResumeLayout(false);
            this.gbDificultada.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel Pcanvas;
        private System.Windows.Forms.Button btnJugar;
        private System.Windows.Forms.GroupBox gbDificultada;
        private System.Windows.Forms.RadioButton radioButton3;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.RadioButton rbFacil;
    }
}

