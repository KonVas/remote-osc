//Monitoring Incoming Data
OSCFunc.trace(true, true);
NetAddr.langPort;

s.options.outDevice_("ZoomAudioD");
s.reboot

(
OSCdef(\input, {| msg |
	var string = msg[1].asString;
//	~asciiFunc.value(string);
	//~code_interp.value(string)
	d = string.interpret.asDict;
	string.postln
}, '/serkan')
)


~code_interp = ({| string |
	if ( string.notNil ) {
		string = string
		.drop(1)
		.interpretPrint
	} {
		"not code".postln
	}
});





~asciiFunc = ({| string |
	if ( string.notNil ) {
	var ascii = string.ascii;
	~updateData.value(ascii);
	}
});

(note: 0.444).play

Spec.add(\freq, [120, 1220.0])
Spec.add(\crack, [0.01, 0.99])
p = Prand(d.values.abs, inf).asStream
p.next

(
~updateData = ({| data |
	if ( data.notNil ) {
		if  ( data.isArray ) {

			(
				Pdef(\x,
					Pbind(
						\instrument, \risset,
						\dur, d.values.abs[0]*rrand(0.1, 0.5),
						\freq, Pfunc{\freq.asSpec.map(d.values.abs[0])},
						\sustain, 0.25,
						\detune, 0.1,
						\amp, 0.5
				));

				Pdef(\y,
					Pbind(
						\instrument, \scfm,
						\dur, d.values.abs[1]*rrand(0.1, 0.5),
						\freq, Pfunc{\freq.asSpec.map(d.values.abs[0])},
						\sustain, Pwhite(0.1, 0.6),
						\octave, 1,
						\detune, 0.1,
						\amp, 0.9
				));

				Pdef(\z,
					Pbind(
						\instrument, \crackle,
						\dur, d.values.abs[1]*rrand(0.1, 0.5),
						\crack, Pfunc{\crack.asSpec.map(d.values.abs[0])+rrand(0.1, 0.5)},
						\sustain, Pwhite(0.1, 0.6),
						\detune, 0.1,
						\amp, 0.7
				))
			)
		}
	}
})
)
)

//convert pdefs to ndef so can filter them later:
Ndef(\x, Pdef(\x))
Ndef(\y, Pdef(\y))
Ndef(\z, Pdef(\z))

//start them like this:
Ndef(\x).play
Ndef(\y).play
Ndef(\z).play

NdefMixer(s)

Ndef(\y)[1] = \filter -> {|in| CombC.ar(Ndef(\z).ar, 0.02, 0.03, 0.5)}
Ndef(\y)[2] = \filter -> {|in| PitchShift.ar(in*Ndef(\z).ar, 0.25, 0.3, 0.5)}


Pbindef(\y).quant_(0, 2, 1)