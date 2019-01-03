% calcul du delta ann�e moyen entre ce qui l'age r�el et l'age d�tect�
function deltaAnnee = decisionFCM_tous(classifieur,folder,m)
    deltaAnnee = 0;
    imagefiles = dir(fullfile(folder,'*.jpg'));
    for i = 1:size(imagefiles,1)
       A = sscanf(imagefiles(i).name,'%d_%d');
       age = A(2);
       ageDetecte = decisionFCM(classifieur,imread(imagefiles(i).name),m);
       deltaAnnee = deltaAnnee + abs(age - ageDetecte);
    end
    deltaAnnee = deltaAnnee/size(imagefiles,1);
end