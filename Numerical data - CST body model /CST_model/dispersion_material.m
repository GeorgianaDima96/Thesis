function [eps_real,eps_imag,skin_depth, sigma]=dispersion_material(f,type_of_material)


switch type_of_material
       
        case 'Aorta'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4e1,8.842e-12,1e-1,5e1,3.183e-9,1e-1,1e5,1.592e-4,2e-1,1e7,1.592e-3,0,0.25,'Aorta');
        
        case 'Bladder'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,1.6e1,8.842e-12,1e-1,4e2,1.592e-7,1e-1,1e5,1.592e-4,2e-1,1e7,1.592e-2,0,0.2,'Bladder');
             
        case 'Blood'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5.6e1,8.377e-12,1e-1,5.2e3,1.326e-7,1e-1,0,1.592e-4,2e-1,0,1.592e-2,0,0.7,'Blood');
            
        case 'Bone Cancellous'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,1.8e1,1.326e-11,2.2e-1,3e2,7.958e-8,2.5e-1,2e4,1.592e-4,2e-1,2e7,1.592e-2,0,7e-2,'Bone Cancellous');

        case 'Bone Cortical'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,1e1,1.326e-11,2e-1,1.8e2,7.958e-8,2e-1,5e3,1.592e-4,2e-1,1e5,1.592e-2,0,2e-2,'Bone Cortical');

        case 'Bone Marrow (Infiltrated)'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,9,1.447e-11,2e-1,8e1,1.592e-8,1e-1,1e4,1.592e-3,1e-1,2e6,1.592e-2,1e-1,1e-1,'Bone Marrow (Infiltrated)');
        
        case 'Bone Marrow (Not Infiltrated)'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,3,7.958e-12,2e-1,2.5e1,1.592e-8,1e-1,5e3,1.592e-3,1e-1,2e6,1.592e-2,1e-1,5e-4,'Bone Marrow (Not Infiltrated)');
        
        case 'Bone Marrow'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,3,7.958e-12,2e-1,2.5e1,1.592e-8,1e-1,5e3,1.592e-3,1e-1,2e6,1.592e-2,1e-1,5e-4,'Bone Marrow');
        
        case 'Breast Fat'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,3,1.768e-11,1e-1,1.5e1,6.366e-8,1e-1,5e4,4.547e-4,1e-1,2e7,1.326e-2,0,1e-2,'Breast Fat');
        
        case 'Cartilage'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,3.8e1,1.326e-11,1.5e-1,2.5e3,1.447e-7,1.5e-1,1e5,3.183e-4,1e-1,4e7,1.592e-2,0,1.5e-1,'Cartilage');
        
        case 'Cerebellum'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4e1,7.958e-12,1e-1,7e2,1.592e-8,1.5e-1,2e5,1.061e-4,2.2e-1,4.5e7,5.205e-3,0,4e-2,'Cerebellum');
        
        case 'Cerebro Spinal Fluid'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,6.5e1,7.958e-12,1e-1,4e1,1.592e-9,0,0,1.592e-4,0,0,1.592e-3,0,2,'Cerebro Spinal Fluid');
        
        case 'Cervix'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.5e1,7.958e-12,1e-1,2e2,1.592e-8,1e-1,1.5e5,1.061e-4,1.8e-1,4e7,1.592e-3,0,3e-1,'Cervix');
        
        case 'Colon'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5e1,7.958e-12,1e-1,3e3,1.592e-7,2e-1,1e5,1.592e-4,2e-1,4e7,1.592e-3,0,1e-2,'Colon');
        
        case 'Cornea'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.8e1,7.958e-12,1e-1,4e3,1.592e-7,5e-2,1e5,1.592e-5,2e-1,4e7,1.592e-2,0,4e-1,'Cornea');
        
        case 'Dura'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4e1,7.958e-12,1.5e-1,2e2,7.958e-9,1e-1,1e4,1.592e-4,2e-1,1e6,1.592e-2,0,5e-1,'Dura');
        
        case 'Eye Tissues (Sclera)'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5e1,7.958e-12,1e-1,4e3,1.592e-7,1e-1,1e5,1.592e-4,2e-1,5e6,1.592e-2,0,5e-1,'Eye Tissues (Sclera)');
        
        case 'Fat (Average Infiltrated)'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,9,7.958e-12,2e-1,3.5e1,1.592e-8,1e-1,3.3e4,1.592e-4,5e-2,1e7,1.592e-2,1e-2,3.5e-2,'Fat (Average Infiltrated)');
        
        case 'Fat (Not Infiltrated)'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,3,7.958e-12,2e-1,1.5e1,1.592e-8,1e-1,3.3e4,1.592e-4,5e-2,1e7,7.958e-3,1e-2,1e-2,'Fat (Not Infiltrated)');
        
        case 'Fat'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,3,7.958e-12,2e-1,1.5e1,1.592e-8,1e-1,3.3e4,1.592e-4,5e-2,1e7,7.958e-3,1e-2,1e-2,'Fat');
        
        case 'Gall Bladder'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5.5e1,7.579e-12,5e-2,4e1,1.592e-9,0,1e3,1.592e-4,2e-1,1e4,1.592e-2,0,9e-1,'Gall Bladder');
        
        case 'Gall Bladder Bile'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,6.6e1,7.579e-12,5e-2,5e1,1.592e-9,0,0,1.592e-4,2e-1,0,1.592e-2,2e-1,1.4,'Gall Bladder Bile');
        
        case 'Grey Matter'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.5e1,7.958e-12,1e-1,4e2,1.592e-8,1.5e-1,2e5,1.061e-4,2.2e-1,4.5e7,5.3-5e-3,0,2e-2,'Grey Matter');
        
        case 'Heart'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5e1,7.958e-12,1e-1,1.2e3,1.592e-7,5e-2,4.5e5,7.234e-5,2.2e-1,2.5e7,4.547e-3,0,5e-2,'Heart');
        
        case 'Kidney'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.7e1,7.958e-12,1e-1,3.5e3,1.989e-7,2.2e-1,2.5e5,7.958e-5,2.2e-1,3e7,4.547e-3,0,5e-2,'Kidney');
        
        case 'Lens Cortex'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.2e1,7.958e-12,1e-1,1.5e3,7.958e-8,1e-1,2e5,1.592e-4,1e-1,4e7,1.592e-2,0,3e-1,'Lens Cortex');
        
        case 'Lens Nucleus'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,3,3.2e1,8.842e-12,1e-1,1e2,1.061e-8,2e-1,1e3,1.592e-5,2e-1,5e3,1.592e-2,0,2e-1,'Lens Nucleus');
        
        case 'Liver'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,3.9e1,8.842e-12,1e-1,6e3,5.305e-7,2e-1,5e4,2.274e-5,2e-1,3e7,1.592e-2,5e-2,2e-2,'Liver');
        
        case 'Lung Deflated'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.5e1,7.958e-12,1e-1,1e3,1.592e-7,1e-1,5e5,1.592e-4,2e-1,1e7,1.592e-2,0,2e-1,'Lung Deflated');
        
        case 'Lung Inflated'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,1.8e1,7.958e-12,1e-1,5e2,6.366e-8,1e-1,2.5e5,1.592e-4,2e-1,4e7,7.958e-3,0,3e-2,'Lung Inflated');
        
        case 'Muscle'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5e1,7.234e-12,1e-1,7e3,3.537e-7,1e-1,1.2e6,3.183e-4,1e-1,2.5e7,2.274e-3,0,2e-1,'Muscle');
        
        case 'Nerve'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,2.6e1,7.958e-12,1e-1,5e2,1.061e-7,1.5e-1,7e4,1.592e-5,2e-1,4e7,1.592e-2,0,6e-3,'Nerve');
        
        case 'Ovary'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4e1,8.842e-12,1.5e-1,4e2,1.592e-8,2.5e-1,1e5,1.592e-4,2.7e-1,4e7,1.592e-2,0,3e-1,'Ovary');
        
        case 'Skin (Dry)'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,3.2e1,7.234e-12,0,1.1e3,3.248e-8,2e-1,0,1.592e-4,2e-1,0,1.592e-2,2e-1,2e-4,'Skin (Dry)');
        
        case 'Skin (Wet)'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,3.9e1,7.958e-12,1e-1,2.8e2,7.958e-8,0,3e4,1.592e-6,1.6e-1,3e4,1.592e-3,2e-1,4e-4,'Skin (Wet)');
        
        case 'Small Intestine'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5e1,7.958e-12,1e-1,1e4,1.592e-7,1e-1,5e5,1.592e-4,2e-1,4e7,1.592e-2,0,5e-1,'Small Intestine');
        
        case 'Spleen'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.8e1,7.958e-12,1e-1,2.5e3,6.366e-8,1.5e-1,2e5,2.653e-4,2.5e-1,5e7,6.366e-3,0,3e-2,'Spleen');
        
        case 'Stomach'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,6e1,7.958e-12,1e-1,2e3,7.958e-8,1e-1,1e5,1.592e-4,2e-1,4e7,1.592e-2,0,5e-1,'Stomach');
        
        case 'Tendon'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,4.2e1,1.224e-11,1e-1,6e1,6.266e-9,1e-1,6e4,3.183e-4,2.2e-1,2e7,1.326e-3,0,2.5e-1,'Tendon');
        
        case 'Testis'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5.5e1,7.958e-12,1e-1,5e3,1.592e-7,1e-1,1e5,1.592e-4,2e-1,4e7,1.592e-2,0,4e-1,'Testis');
        
        case 'Thyroid'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5.5e1,7.958e-12,1e-1,2.5e3,1.592e-7,1e-1,1e5,1.592e-4,2e-1,4e7,1.592e-2,0,5e-1,'Thyroid');
        
        case 'Tongue'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5e1,7.958e-12,1e-1,4e3,1.592e-7,1e-1,1e5,1.592e-4,2e-1,4e7,1.592e-2,0,2.5e-1,'Tongue');
        
        case 'Trachea'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,2.5,3.8e1,7.958e-12,1e-1,4e2,6.366e-8,1e-1,5e4,1.592e-5,2e-1,1e6,1.592e-2,0,3e-1,'Trachea');
        
        case 'Uterus'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,5.5e1,7.958e-12,1e-1,8e2,3.183e-8,1e-1,3e5,1.592e-4,2e-1,3.5e7,1.061e-3,0,2e-1,'Uterus');
        
        case 'Vitreous Humour'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,6.5e1,7.234e-12,0,3e1,1.592e-7,1e-1,0,1.592e-4,0,0,1.592e-2,0,1.5,'Vitreous Humour');
        
        case 'White Matter'
        [eps_real,eps_imag,skin_depth, sigma] = dispersion_EM_Cole_Cole(f,4,3.2e1,7.958e-12,1e-1,1e2,7.958e-9,1e-1,4e4,5.305e-5,3e-1,3.5e7,7.958e-3,2e-2,2e-2,'White Matter');
        


end
end