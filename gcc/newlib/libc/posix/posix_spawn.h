#ifndef _POSIX_SPAWN_H_
#define	_POSIX_SPAWN_H_

#include <sys/cdefs.h>
#include <sys/sched.h>
#include <sys/signal.h>
#include <sys/types.h>
#include <sys/queue.h>

struct __posix_spawnattr {
	short			sa_flags;
	pid_t			sa_pgroup;
	struct sched_param	sa_schedparam;
	int			sa_schedpolicy;
	sigset_t		sa_sigdefault;
	sigset_t		sa_sigmask;
};

struct __posix_spawn_file_actions {
	STAILQ_HEAD(, __posix_spawn_file_actions_entry) fa_list;
};

typedef struct __posix_spawn_file_actions_entry {
	STAILQ_ENTRY(__posix_spawn_file_actions_entry) fae_list;
	enum {
		FAE_OPEN,
		FAE_DUP2,
		FAE_CLOSE,
		FAE_CHDIR,
		FAE_FCHDIR
	} fae_action;

	int fae_fildes;
	union {
		struct {
			char *path;
#define fae_path	fae_data.open.path
			int oflag;
#define fae_oflag	fae_data.open.oflag
			mode_t mode;
#define fae_mode	fae_data.open.mode
		} open;
		struct {
			int newfildes;
#define fae_newfildes	fae_data.dup2.newfildes
		} dup2;
		char *dir;
#define fae_dir		fae_data.dir
		int dirfd;
#define fae_dirfd		fae_data.dirfd
	} fae_data;
} posix_spawn_file_actions_entry_t;

#endif /* !_POSIX_SPAWN_H_ */
