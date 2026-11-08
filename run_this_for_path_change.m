mdl    = 'Exoskeleton1';
folder = 'Teb sem5';        % <- change to your folder name (relative to the project folder)

load_system(mdl);
blks = find_system(mdl, 'LookUnderMasks','all', 'FollowLinks','on', ...
    'RegExp','on', 'ExtGeomFileName','.+');

for i = 1:numel(blks)
    old = get_param(blks{i}, 'ExtGeomFileName');
    [~, n, e] = fileparts(old);                 % keeps only the file name
    new = [folder '/' n e];                     % e.g. Teb sem5/false_thigh.SLDPRT
    set_param(blks{i}, 'ExtGeomFileName', new);
    fprintf('%s -> %s\n', old, new);
end
save_system(mdl);