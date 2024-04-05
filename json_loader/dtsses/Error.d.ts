// Generated by https://quicktype.io
//
// To change quicktype's target language, run command:
//
//   "Set quicktype target language"

export interface Error {
    id: string;
    index: number;
    period: number;
    timestamp: string;
    minute: number;
    second: number;
    type: Foreign;
    possession: number;
    possession_team: Foreign;
    play_pattern: Foreign;
    team: Foreign;
    player: Foreign;
    position: Foreign;
    location: number[];
    duration: number;
    under_pressure: boolean;
    off_camera: boolean;
}

export interface Foreign {
    id: number;
    name: string;
}
