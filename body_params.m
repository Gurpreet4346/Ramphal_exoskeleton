%% body_params.m
% Body Mass Parameters based on de Leva (1996) segment mass fractions
% Total Body Mass M_body = 68.00 kg

M_body = 68.00;

% Segment mass fractions and target masses:
% 1. Pelvis (dome): 11.17%
m_pelvis = 0.1117 * M_body;     % 7.5956 -> 7.60 kg

% 2. Spine segments 1, 2, 3 (AH_Spine 7, 8, 9): 3.70 kg each
m_spine1 = 3.70;
m_spine2 = 3.70;
m_spine3 = 3.70;

% 3. Spine segments 4, 5 (AH_Spine 10, 11): 3.62 kg each
m_spine4 = 3.62;
m_spine5 = 3.62;

% 4. Top upper-body block (AH_Spine 12 carries torso above spine + head + arms):
% remaining chest 3.62 + arms 6.72 + head 4.72 = 15.06 kg
if ~exist('m_payload', 'var')
    m_payload = 0; % Default: no external payload
end
m_top_upper_body = 15.06 + m_payload;

% 5. Lower limbs:
% Thighs: 9.63 kg each
m_thigh_right = 9.63;
m_thigh_left  = 9.63;

% Shanks + Feet: each shank (2.94 kg) + foot (0.93 kg) = 3.87 kg each
m_shank_foot_right = 3.87;
m_shank_foot_left  = 3.87;

% Sum check:
% 7.60 + 3*3.70 + 2*3.62 + 15.06 + 2*9.63 + 2*3.87 = 68.00 kg
m_total_body = m_pelvis + m_spine1 + m_spine2 + m_spine3 + m_spine4 + m_spine5 + ...
               m_top_upper_body + m_thigh_right + m_thigh_left + ...
               m_shank_foot_right + m_shank_foot_left;

% 6. Distributed Spine Motion Weight
if ~exist('spine_motion_weight', 'var')
    spine_motion_weight = 0.25; % Default weight for distributed spine flexion
end

% 7. Exoskeleton Motor Assist Profile Defaults
if ~exist('tau_spool_time', 'var')
    tau_spool_time = linspace(0, 4.5, 451)';
end
if ~exist('tau_spool_table', 'var')
    tau_spool_table = zeros(size(tau_spool_time)); % Default: unassisted
end

fprintf('body_params.m loaded: Total body mass = %.2f kg, spine_motion_weight = %.2f\n', m_total_body, spine_motion_weight);
